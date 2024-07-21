const Room = require('../models/room')

exports.chatRoom = async (req, res) => {
    try {
        const memberIds = req.body.memberIds
        memberIds.sort()
        const existingRoom = await Room.findOne({
            members: memberIds
        })
        if(existingRoom) {
            return res.status(400).json({
                message: 'Room already exists',
                room: existingRoom._id
            })
        }
        const saveRoom = await Room.create({
            members: memberIds
        })
        res.status(200).json({
            message: 'Room created successfully',
            room: saveRoom._id
        })
    } catch(error) {
        console.log(error)
        res.status(500).json({message: 'Internal Server Error'})
    }
}