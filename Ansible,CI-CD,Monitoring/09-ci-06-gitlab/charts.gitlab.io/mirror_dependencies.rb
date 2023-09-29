# frozen_string_literal: true

require 'yaml'
require 'down'
require 'semverly' # semver comparisons
require 'digest'   # compare checksums of tarballs

REQUIREMENTS_URL = ENV['REQUIREMENTS_URL'] || 'https://gitlab.com/gitlab-org/charts/gitlab/-/raw/master/requirements.yaml'

def download_requirements
  Down.download(REQUIREMENTS_URL)
end

def download_index(repository:)
  Down.download("#{repository}/index.yaml")
end

def download_tarball(url:, destination:)
  tempfile = Down.download(url)
  FileUtils.move tempfile, destination
end

def existing_digest(existing:, digest:)
  sha2 = Digest::SHA2.new
  File.open(existing) do |f|
    while (chunk = f.read(1024))
      sha2 << chunk
    end
  end

  (digest == sha2.hexdigest)
end

def fetch_tarball(repository:, tarball_url:, destination_dir: 'mirror/', digest:)
  download = true
  url = tarball_url
  url = "#{repository}/#{tarball_url}" unless tarball_url.start_with? 'https://'

  basename = File.basename(url)
  destination = File.expand_path("#{destination_dir}/#{basename}")

  if File.exist? destination
    puts "== Package exists @ #{destination}"
    download = !existing_digest(existing: destination, digest: digest)
  end

  return unless download

  puts "++ Downloading #{url}"
  download_tarball(url: url, destination: destination)
end

def fetch_all_dependencies
  found = []
  puts "Fetching requirements '#{REQUIREMENTS_URL}"
  requirements = YAML.safe_load(download_requirements)

  remotes = requirements['dependencies'].filter { |i| i['repository'] }

  remotes.each do |remote|
    puts "Fetching index from #{remote['repository']}"
    index = YAML.safe_load(download_index(repository: remote['repository']))
    chart = index['entries'][remote['name']]
    puts "-- Looking up #{remote['name']} @ #{remote['version']}"
    version = chart.select do |v|
      chart_verison = SemVer.parse(v['version'])
      remote_version = SemVer.parse(remote['version'])

      chart_verison == remote_version
    end

    next unless version.length

    found.append version[0]
    fetch_tarball(
      repository: remote['repository'],
      tarball_url: version[0]['urls'][0],
      digest: version[0]['digest']
    )
  end
end

fetch_all_dependencies
