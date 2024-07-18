const Message = require('../models/message')

exports.chatHistory = async (req, res) => {
    try {
        const roomId = req.query.roomId
        if(!roomId) {
            return res.status(400).json({message: 'No room ID provided'})
        }
        const allMessages = await Message.find({roomId: roomId})
        res.status(200).json({
            message: 'Chats fetched',
            chats: allMessages
        })
    } catch(error) {
        console.log(error)
        res.status(500).json({message: 'Internal Server Error'})
    }
}