const express = require('express');
const router = express.Router();
const imageController = require('../controllers/imageController');

router.get('/album/:albumId', imageController.getImagesByAlbum);
router.get('/user/:userId', imageController.getImagesByUser);
router.get('/:id', imageController.getImageById);
router.post('/', imageController.createImage);
router.put('/:id', imageController.updateImage);
router.delete('/:id', imageController.deleteImage);

module.exports = router;
