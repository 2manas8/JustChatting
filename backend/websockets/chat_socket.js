const chatSocket = (socket) => {
    socket.on('sendMessage', (message) => {
        socket.emit('receiveMessage', message)
    })
}

module.exports = chatSocket