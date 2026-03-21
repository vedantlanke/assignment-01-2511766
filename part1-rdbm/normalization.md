## Anomaly Analysis
Insert Anomaly:
A new product such as "Tablet" cannot be inserted into the system unless an order record is created. 
This is because product information exists only within order rows (e.g., columns product_id, product_name).

Update Anomaly:
Customer "Priya Sharma" appears in multiple rows such as ORD1027 and ORD1002.
If her city changes from Delhi to Gurgaon, multiple rows must be updated, creating risk of inconsistent data.

Delete Anomaly:
If order ORD1027 (Notebook purchase) is deleted and this is the only occurrence of product P004,
then all information about the Notebook product will be lost from the database.
