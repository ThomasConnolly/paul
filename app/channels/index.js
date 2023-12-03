const channels = require.context('.', true, /_channel\.js$/)
channels.key().forEach(channels)