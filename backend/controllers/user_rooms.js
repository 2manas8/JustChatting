const Room = require('../models/room')
const User = require('../models/user')
const Message = require('../models/message')

const extractUserDetails = async (rooms, userId) => {
    const otherUserIds = []
    for(const room of rooms) {
        for(const member of room.members) {
            if(member != userId) {
                const user = await User.findOne({_id: member})
                otherUserIds.push({
                    userId: user._id,
                    name: user.name,
                    username: user.username
                })
            }
        }
    }
    return otherUserIds
}

const notEmptyRooms = async (rooms) => {
    const finalRooms = []
    for(const room of rooms) {
        const allMessages = await Message.find({roomId: room._id})
        if(allMessages.length != 0) {
            finalRooms.push(room)
        }
    }
    return finalRooms
}

exports.userRooms = async (req, res) => {
    try {
        const userId = req.query.userId
        const rooms = await Room.find({members: userId})
        const finalRooms = await notEmptyRooms(rooms)
        if(finalRooms.length == 0) {
            return res.status(400).json({message: 'No rooms found'})
        }
        const otherUserDetails = await extractUserDetails(finalRooms, userId)
        res.status(200).json({
            message: 'Rooms found successfully',
            users: otherUserDetails
        })
    } catch(error) {
        res.status(500).json({message: 'Internal Server Error'})
    }
}