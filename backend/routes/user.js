const express = require('express')
const router = express.Router()

const {userRooms} = require('../controllers/user_rooms')
router.get('/user_rooms', userRooms)

const {userDetails} = require('../controllers/user_details')
router.get('/user_details', userDetails)

module.exports = router