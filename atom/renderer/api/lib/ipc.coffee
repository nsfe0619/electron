deprecate = require 'deprecate'

binding = process.atomBinding 'ipc'
v8Util  = process.atomBinding 'v8_util'

# Created by init.coffee.
ipc = v8Util.getHiddenValue global, 'ipc'

ipc.send = (args...) ->
  binding.send 'ipc-message', [args...]

ipc.sendSync = (args...) ->
  JSON.parse binding.sendSync('ipc-message-sync', [args...])

ipc.sendToHost = (args...) ->
  binding.send 'ipc-message-host', [args...]

# Deprecated.
deprecate.rename ipc, 'sendChannel', 'send'
deprecate.rename ipc, 'sendChannelSync', 'sendSync'

module.exports = ipc
