const Message = require('../models/message')

exports.deleteChat = async (req, res) => {
    try {
        const roomId = req.query.roomId
        if(!roomId) {
            res.status(400).json({message: 'No room ID provided'})
        }
        await Message.deleteMany({roomId: roomId})
        res.status(200).json({message: 'Chats deleted successfully'})
    } catch(error) {
        res.status(500).json({message: 'Internal Server Error'})
    }
}