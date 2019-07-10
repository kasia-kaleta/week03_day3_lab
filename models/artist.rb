require_relative('../db/sql_runner')
require_relative('album')

class Artist

attr_reader :id, :name

def initialize(options)
  @id = options['id'].to_i if options['id']
  @name = options['name']
end

def save()
  sql = "INSERT INTO artists(name)
  VALUES ($1)
  RETURNING id"
  values = [@name]
  @id = SqlRunner.run(sql, values)[0]['id'].to_i
end

def albums()
  sql = "SELECT * FROM albums
  WHERE artist_id = $1"
  values = [@id]
  album_hashes = SqlRunner.run(sql, values)
  albums = album_hashes.map{ |album| Album.new(album) }
  return albums
end

def self.delete_all()
  sql = "DELETE FROM artists"
  SqlRunner.run(sql)
end



end
