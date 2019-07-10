require('pry')
require_relative('../models/artist')
require_relative('../models/album')

Artist.delete_all()

artist1 = Artist.new({
  'name' => 'Sia'
  })

  artist1.save()

album1 = Album.new({
  'title' => '1000 Forms of Fear',
  'genre' => 'pop',
  'artist_id' => artist1.id
  })

album1.save()



  binding.pry
  nil
