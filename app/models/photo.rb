class Photo < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  attr_accessible :info, :name, :category_id, :user_id, :image
  mount_uploader :image, ImageUploader
  validates :name, presence: true
  validates :category_id, presence: true
  validates :image, presence: true

  def self.search_by_name(search)
  	if search
      # sql = "select * from photos where name like '%" + search + "%'"
  		sql = "select * from photos where name like '%#{search}%'"
      # sql = "select * 
      #       from (
      #         select p.*, count(l.id) as total_likes, dense_rank() over (order by count(l.id) desc) as rank
      #         from photos as p left join like_dislikes as l on p.id = l.photo_id
      #         group by p.id
      #         order by p.id) as T
      #       where T.name like '%#{search}%'"

  		Photo.find_by_sql(sql)
  	else
      Photo.all
  		# sql = "select p.*, count(l.id) as total_likes, dense_rank() over (order by count(l.id) desc) as rank
    #       from photos as p left join like_dislikes as l on p.id = l.photo_id
    #       group by p.id
    #       order by p.id"
    #   Photo.find_by_sql(sql)
  	end

  	# if search
	  #   where 'name LIKE ?', "%#{search}%"
	  # else
	  #   scoped
	  # end
  end

  def self.related_photo(category_id, current_photo_id)
    Photo.where(['category_id = ? and id != ?', category_id, current_photo_id])
  end
end
