const chatSocket = (socket) => {
    socket.on('sendMessage', (message) => {
        socket.broadcast.emit('receiveMessage', message)
    })
}

module.exports = chatSocket