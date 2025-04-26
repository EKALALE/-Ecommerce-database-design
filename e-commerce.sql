
CREATE TABLE brand (
    brand_id INT AUTO_INCREMENT PRIMARY KEY,
    brand_name VARCHAR(255) NOT NULL
);


CREATE TABLE product_category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL
);


CREATE TABLE product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    base_price DECIMAL(10,2),
    brand_id INT,
    category_id INT,
    FOREIGN KEY (brand_id) REFERENCES brand(brand_id),
    FOREIGN KEY (category_id) REFERENCES product_category(category_id)
);


CREATE TABLE product_image (
    image_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    image_url VARCHAR(500),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);


CREATE TABLE color (
    color_id INT AUTO_INCREMENT PRIMARY KEY,
    color_name VARCHAR(100) NOT NULL
);


CREATE TABLE size_category (
    size_cat_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE size_option (
    size_id INT AUTO_INCREMENT PRIMARY KEY,
    size_cat_id INT,
    size_value VARCHAR(50) NOT NULL,
    FOREIGN KEY (size_cat_id) REFERENCES size_category(size_cat_id)
);


CREATE TABLE product_item (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    price DECIMAL(10,2),
    stock_qty INT,
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);


CREATE TABLE product_variation (
    variation_id INT AUTO_INCREMENT PRIMARY KEY,
    item_id INT,
    color_id INT,
    size_id INT,
    FOREIGN KEY (item_id) REFERENCES product_item(item_id),
    FOREIGN KEY (color_id) REFERENCES color(color_id),
    FOREIGN KEY (size_id) REFERENCES size_option(size_id)
);

CREATE TABLE attribute_category (
    attr_cat_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE attribute_type (
    attr_type_id INT AUTO_INCREMENT PRIMARY KEY,
    type_name VARCHAR(100) NOT NULL -- e.g., text, number, boolean
);


CREATE TABLE product_attribute (
    attr_id INT AUTO_INCREMENT PRIMARY KEY,
    item_id INT,
    attr_cat_id INT,
    attr_type_id INT,
    attr_value VARCHAR(255),
    FOREIGN KEY (item_id) REFERENCES product_item(item_id),
    FOREIGN KEY (attr_cat_id) REFERENCES attribute_category(attr_cat_id),
    FOREIGN KEY (attr_type_id) REFERENCES attribute_type(attr_type_id)
);
