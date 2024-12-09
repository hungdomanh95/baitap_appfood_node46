CREATE TABLE users (
	user_id INT PRIMARY KEY AUTO_INCREMENT,
	full_name VARCHAR(255),
	email VARCHAR(255),
	pass_word VARCHAR(255)
)

INSERT INTO users (user_id, full_name, email, pass_word) VALUES
					(1, 'Hung 1', 'hung1@gmail.com', 1234),
					(2, 'Hung 1', 'hung2@gmail.com', 1234),
					(3, 'Hung 3', 'hung3@gmail.com', 1234),
					(4, 'Hung 4', 'hung4@gmail.com', 1234),
					(5, 'Hung 5', 'hung5@gmail.com', 1234),
					(6, 'Hung 6', 'hung6@gmail.com', 1234)


CREATE TABLE food_type (
	type_id INT PRIMARY KEY AUTO_INCREMENT,
	
	type_name VARCHAR(255)
	
)


INSERT INTO food_type (type_id, type_name) VALUES
					(1, 'Bình Định'),
					(2, 'Quảng Ngãi'),
					(3, 'Bình Thuận'),
					(4, 'Huế')
				


CREATE TABLE foods (
	food_id INT PRIMARY KEY AUTO_INCREMENT,
	
	food_name VARCHAR(255),
	image VARCHAR(255),
	price FLOAT,
	des VARCHAR(255),
	type_id INT,
	FOREIGN KEY (type_id) REFERENCES food_type(type_id)
)

INSERT INTO foods (food_id, food_name,image, price, des, type_id ) VALUES
					(1, 'Bánh cuốn', '123', 20000, 'Đặc sản bình định', 1),
					(2, 'Bánh mì nướng lu', '123', 30000, 'Đặc sản bình định', 1),
					(3, 'Bánh đập', '123', 10000, 'Đặc sản Quảng Ngãi', 2),
					(4, 'Bánh canh chả cá', '123', 45000, 'Đặc sản bình thuận', 3),
					(5, 'Bún bò Huế', '123', 55000, 'Đặc sản Huế', 4)
					


CREATE TABLE sub_food (
	sub_id INT PRIMARY KEY AUTO_INCREMENT,
	
	sub_name VARCHAR(255),

	sub_price FLOAT,

	food_id INT,
	FOREIGN KEY (food_id) REFERENCES foods(food_id)
)

INSERT INTO sub_food (sub_id, sub_name,sub_price, food_id ) VALUES
					(1, 'Bánh cuốn 1', 20000, 1),
					(2, 'Bánh cuốn 2', 20000, 1),
					(3, 'Bánh cuốn 3', 20000, 1),
					(4, 'Bánh đập 1', 10000, 3),
					(5, 'Bánh đập 2', 10000, 3)
			


CREATE TABLE orders (
	user_id INT,
	
	FOREIGN KEY (user_id) REFERENCES users(user_id),
	
	food_id INT,
	FOREIGN KEY (food_id) REFERENCES foods(food_id),
	
	amount INT,
	
	codes VARCHAR(255),
	
	arr_sub_id VARCHAR(255)
)

INSERT INTO orders (user_id, food_id, amount, codes, arr_sub_id) VALUES
(1, 2, 30000, 'ABC1', 'ABC1234'),
(3, 1, 40000, 'ABC2', 'ABC1235'),
(2, 5, 50000, 'ABC3', 'ABC1236'),
(1, 3, 60000, 'ABC4', 'ABC1237'),
(3, 2, 70000, 'ABC5', 'ABC1238')

CREATE TABLE restaurants (
	res_id INT PRIMARY KEY AUTO_INCREMENT,
	
	res_name VARCHAR(255),

	image VARCHAR(255),

	des VARCHAR(255)
)

INSERT INTO restaurants (res_id, res_name, image, des) VALUES
(1, 'A MÀ', 'image1', 'Nhà Hàng món Trung'),
(2, 'GoGi', 'image2', 'Nhà Hàng thịt nướng Hàn Quốc'),
(3, 'SaSin', 'image3', 'Nhà Hàng mì cay Hàn Quốc'),
(4, 'Chang', 'image4', 'Nhà Hàng Thái Lan')


CREATE TABLE like_res (
	user_id INT,
	
	FOREIGN KEY (user_id) REFERENCES users(user_id),
	
	res_id INT,
	
	FOREIGN KEY (res_id) REFERENCES restaurants(res_id),
	
	date_like DATE
	
)


INSERT INTO like_res (user_id, res_id, date_like) VALUES
(1, 1, '2024-11-09'),
(2, 1, '2024-11-09'),
(3, 1, '2024-11-09'),
(4, 1, '2024-11-09'),
(1, 2, '2024-11-09'),
(2, 2, '2024-11-09'),
(3, 4, '2024-11-09'),
(5, 3, '2024-11-09'),
(1, 3, '2024-11-09')



CREATE TABLE rate_res (
	user_id INT,
	
	FOREIGN KEY (user_id) REFERENCES users(user_id),
	
	res_id INT,
	
	FOREIGN KEY (res_id) REFERENCES restaurants(res_id),
	
	amount INT,
	
	date_rate DATE
	
)

INSERT INTO rate_res (user_id, res_id,amount, date_rate) VALUES
(1, 1,10000, '2024-11-09'),
(2, 1,10000, '2024-11-09'),
(3, 1,10000, '2024-11-09'),
(4, 1,10000, '2024-11-09'),
(1, 2,10000, '2024-11-09'),
(2, 2,10000, '2024-11-09'),
(3, 4,10000, '2024-11-09'),
(5, 3,10000, '2024-11-09'),
(1, 3,10000, '2024-11-09')



-- Tìm 5 người đã like nhà hàng nhiều nhất.
SELECT COUNT(like_res.user_id) AS 'Số lần like', like_res.user_id, users.user_id, users.full_name, users.email, users.pass_word
FROM like_res
INNER JOIN users ON like_res.user_id = users.user_id
GROUP BY like_res.user_id
ORDER BY `Số lần like` DESC
LIMIT 5



-- Tìm 2 nhà hàng có lượt like nhiều nhất.
SELECT COUNT(like_res.res_id) AS 'Số lần được like', like_res.res_id, restaurants.res_id, restaurants.res_name, restaurants.des, restaurants.image
FROM like_res
INNER JOIN restaurants ON like_res.res_id = restaurants.res_id
GROUP BY like_res.res_id
ORDER BY `Số lần được like` DESC
LIMIT 2

-- Tìm người đã đặt hàng nhiều nhất.

SELECT 
    users.user_id,
    users.full_name,
    COUNT(orders.user_id) as total_orders
FROM users
INNER JOIN orders ON users.user_id = orders.user_id
GROUP BY users.user_id, users.full_name
ORDER BY total_orders DESC
LIMIT 1;


-- Tìm người dùng không hoạt động trong hệ thống
-- (không đặt hàng, không like, không đánh giá nhà
-- hàng)

SELECT users.full_name AS 'Những người không hoạt động'
FROM users
LEFT JOIN orders ON orders.user_id = users.user_id 
LEFT JOIN like_res ON like_res.user_id = users.user_id
LEFT JOIN rate_res ON rate_res.user_id = users.user_id
WHERE orders.user_id IS NULL 
AND like_res.user_id IS NULL 
AND rate_res.user_id IS NULL;