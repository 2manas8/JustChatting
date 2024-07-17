const Message = require('../models/message')

const chatSocket = (socket) => {
    socket.on('joinRoom', async (roomId) => {
        socket.join(roomId)
        socket.emit('Successfully joined room ' + roomId)
    })
    socket.on('leaveRoom', (roomId) => {
        socket.leave(roomId)
        console.log('User left the room: ' + roomId)
    })
    socket.on('sendMessage', (data) => {
        const roomId = data.roomId
        const sender = data.sender
        const message = data.message
        try {
            Message.create({
                roomId: roomId,
                sender: sender,
                message: message,
            });
            socket.to(roomId).emit('receiveMessage', message);
        } catch (error) {
            console.error('Error saving message:', error);
        }
    })
}

module.exports = chatSocket