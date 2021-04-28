users_list = {
    "ENE" => {
      :email => "ene@test.com",
      :password_digest => BCrypt::Password.create('password')
    },
    "AYAYA" => {
        :email => "ayaya@test.com",
        :password_digest => BCrypt::Password.create('password')
    },
    "JOJO" => {
        :email => "jojo@test.com",
        :password_digest => BCrypt::Password.create('password')
    },
    "UMU" => {
        :email => "umu@test.com",
        :password_digest => BCrypt::Password.create('password')
    },
  }

users_list.each do |username, user_hash|
  u = User.new
  u.username = username
  user_hash.each do |attribute, value|
      u[attribute] = value
  end
  u.save
end

cosplay_list = {
    "Dio" => {
        show: "Jojo's Bizzare adventure",
        user_id: User.find_by(username: "JOJO").id
    },
    "Saber" => {
        show: "Fate Stay/Night",
        user_id: User.find_by(username: "UMU").id
    },
    "Nero" => {
        show: "Fate/EXTRA",
        user_id: User.find_by(username: "UMU").id
    },
    "Phone" => { 
        show: "Kagerou Days",
        user_id: User.find_by(username: "ENE").id
    }
  }

  cosplay_list.each do |character_name, cosplay_hash|
    p = Cosplay.new
    p.character_name = character_name
    cosplay_hash.each do |attribute, value|
      p[attribute] = value
    end
    p.save
  end