namespace :webpack do
  desc 'Compile bundles using webpack'
  task :compile do
    cmd = 'node_modules/.bin/webpack --config ./webpack_production.config.js --json'
    output = `#{cmd}`

    stats = JSON.parse(output)

    File.open('./public/assets/webpack-asset-manifest.json', 'w') do |f|
      f.write stats['assetsByChunkName'].to_json
    end
  end
end