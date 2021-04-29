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

  material_list = {
    "Red Cloth" => {
        store_link: "red_cloth_link",
        cosplay_id: Cosplay.find_by(character_name: "Nero").id
    },
    "Blue Cloth" => {
        store_link: "blue_cloth_link",
        cosplay_id: Cosplay.find_by(character_name: "Saber").id
    },
    "Sword" => {
        store_link: "sword_link",
        cosplay_id: Cosplay.find_by(character_name: "Saber").id
    },
    "Smug" => {
        store_link: "smug_link",
        cosplay_id: Cosplay.find_by(character_name: "Nero").id
    },
    "Screen" => {
        store_link: "Screen_link",
        cosplay_id: Cosplay.find_by(character_name: "Phone").id
    },
    "Button" => {
        store_link: "button_link",
        cosplay_id: Cosplay.find_by(character_name: "Phone").id
    },
    "White Cloth" => {
        store_link: "white_cloth_link",
        cosplay_id: Cosplay.find_by(character_name: "Nero").id
    },
    "Silver Cloth" => {
        store_link: "silver_cloth_link",
        cosplay_id: Cosplay.find_by(character_name: "Saber").id
    },
    "Yellow Cloth" => {
        store_link: "yellow_cloth_link",
        cosplay_id: Cosplay.find_by(character_name: "Dio").id
    },
    "green Cloth" => {
        store_link: "green_cloth_link",
        cosplay_id: Cosplay.find_by(character_name: "Dio").id
    },
    "Bulldozer" => {
        store_link: "bulldozer_link",
        cosplay_id: Cosplay.find_by(character_name: "Dio").id
    },
  }

  material_list.each do |name, material_hash|
    p = Material.new
    p.name = name
    material_hash.each do |attribute, value|
      p[attribute] = value
    end
    p.save
  end