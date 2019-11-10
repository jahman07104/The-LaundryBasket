sophie = User.create(name: "Sophie")
Item.create(name: "Shirts", use: sophie)
Item.create(name: "pants", user: sophie)