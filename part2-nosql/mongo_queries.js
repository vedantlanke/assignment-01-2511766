// OP1: insertMany() — insert all 3 documents

db.products.insertMany([
  {
    _id: 101,
    name: "Apple iPhone 15",
    category: "Electronics",
    brand: "Apple",
    price: 79900,
    specifications: {
      ram: "6GB",
      storage: "128GB",
      processor: "A16 Bionic",
      voltage_requirement: "220V"
    },
    warranty: {
      period_years: 1,
      type: "Manufacturer"
    },
    customer_ratings: [5, 4, 5, 4]
  },
  {
    _id: 102,
    name: "Women Casual Kurti",
    category: "Clothing",
    brand: "Biba",
    price: 1499,
    sizes_available: ["S", "M", "L", "XL"],
    fabric: "Rayon",
    color_variants: ["Red", "Green", "Blue"],
    seller_details: {
      seller_name: "FashionHub",
      seller_rating: 4.3
    }
  },
  {
    _id: 103,
    name: "Aashirvaad Whole Wheat Atta 5kg",
    category: "Groceries",
    brand: "ITC",
    price: 320,
    expiry_date: new Date("2024-11-15"),
    nutritional_information: {
      energy: "340 kcal",
      protein: "12 g",
      fiber: "10 g"
    },
    warehouse_stock: [
      { city: "Bangalore", quantity: 200 },
      { city: "Hyderabad", quantity: 150 }
    ]
  }
]);

// OP2: find() — retrieve all Electronics products with price > 20000

db.products.find({
  category: "Electronics",
  price: { $gt: 20000 }
});


// OP3: find() — retrieve all Groceries expiring before 2025-01-01

db.products.find({
  category: "Groceries",
  expiry_date: { $lt: new Date("2025-01-01") }
});


// OP4: updateOne() — add discount_percent field

db.products.updateOne(
  { _id: 101 },
  { $set: { discount_percent: 15 } }
);


// OP5: createIndex() — create index on category

db.products.createIndex({ category: 1 });

/*
Reason:
Category is frequently used in filtering queries
like searching Electronics / Groceries products.
Indexing reduces full collection scan and improves
query performance and scalability.
*/
