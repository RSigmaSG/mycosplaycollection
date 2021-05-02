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
        show: "Jojo's Bizzare Adventure",
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
        store_link: "https://www.fabric.com/buy/0450279/60-poly-cotton-broadcloth-red",
        quantity: 2,
        price: 70,
        cosplay_id: Cosplay.find_by(character_name: "Nero").id
    },
    "Blue Cloth" => {
        store_link: "https://www.fabric.com/buy/el-295/10-oz-canvas-duck-navy",
        quantity: 2,
        price: 90,
        cosplay_id: Cosplay.find_by(character_name: "Saber").id
    },
    "Sword" => {
        store_link: "https://www.amazon.com/Dream2reality-cosplay-Excalibur-Stainless-Replica/dp/B00PUMJ2WK/",
        quantity: 1,
        price: 110,
        
        cosplay_id: Cosplay.find_by(character_name: "Saber").id
    },
    "Smug" => {
        store_link: "https://www.redbubble.com/i/sticker/Fate-Extra-Saber-by-fogsdrakath/30507098.EJUG5",
        quantity: 1,
        price: 88,
        cosplay_id: Cosplay.find_by(character_name: "Nero").id
    },
    "Screen" => {
        store_link: "https://www.amazon.com/iPhone-Screen-Replacement-Inch-White/dp/B0757LMW85",
        quantity: 2,
        price: 68,
        cosplay_id: Cosplay.find_by(character_name: "Phone").id
    },
    "Button" => {
        store_link: "https://www.fabric.com/buy/0710337/buttons-galore-button-mason-jars-halloween",
        quantity: 2,
        price: 57,
        cosplay_id: Cosplay.find_by(character_name: "Phone").id
    },
    "White Cloth" => {
        store_link: "https://www.fabric.com/buy/am-039/kona-cotton-snow",
        quantity: 2,
        price: 89,
        cosplay_id: Cosplay.find_by(character_name: "Nero").id
    },
    "Silver Cloth" => {
        store_link: "https://www.fabric.com/buy/0314006/kona-cotton-silver",
        quantity: 1,
        price: 56,
        cosplay_id: Cosplay.find_by(character_name: "Saber").id
    },
    "Yellow Cloth" => {
        store_link: "https://www.fabric.com/buy/0313986/kona-cotton-sunny",
        quantity: 2,
        price: 23,
        cosplay_id: Cosplay.find_by(character_name: "Dio").id
    },
    "green Cloth" => {
        store_link: "https://www.fabric.com/buy/ef-291/kona-cotton-o-d-green",
        quantity: 2,
        price: 234,
        cosplay_id: Cosplay.find_by(character_name: "Dio").id
    },
    "Roadroller" => {
        store_link: "https://www.cat.com/en_US/products/new/equipment/compactors/tandem-vibratory-rollers/1000027460.html",
        quantity: 2,
        price: 43000,
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