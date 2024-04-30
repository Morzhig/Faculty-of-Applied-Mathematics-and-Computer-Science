use CarRentalDB

Create Table Clients /* Создание таблицы Клиенты */
(
	id_Client int Primary Key, /* id Клиента, первичный ключ */
	Full_Name nvarchar(50) NOT NULL, /* ФИО Клиента, ограничение - не пустое поле */
	Phone_Number int UNIQUE check(Phone_Number!=''), /* Номер телефона клиента, уникальное поле, проверка на непустоту */
	id_Auto int/* id Взятого автомобиля, внешний ключ*/,
	Foreign Key (id_Auto) REFERENCES Cars(id_Auto)
)

Create Table Cars /* Создание таблицы Автомобили */
(
	id_Auto int Primary Key, /* id Автомобиля, первичный ключ */
	Brand nvarchar(50) Constraint noLada /* Марка автомобиля, ограничение с названием noLada, проверяющее, чтобы название авто не было равно LADA */
	Check (Brand != 'LADA'),
	Model nvarchar(50) NOT NULL, /* Модель автомобиля, не пустое поле */
	Colour nvarchar(50), /* Цвет автомобиля */
	[Availability] varchar(10), /* Наличие автомобиля */
	Cost money default 0
)

Create Table Orders /* Создание таблицы Заказы */
(
	id_Order int Primary Key, /* id Заказа, первичный ключ */
	id_Client int, /* id Клиента */
	id_Auto int, /* id Клиента */
	date_Order date, /* Дата заказа */
	amount_Days int default 0, /* Количество дней, по стандарту равно 0 */
	Constraint noNegativeDays /* Ограничение с названием noNegativeDays, проверяющее, чтобы количество дней было положительным */
	Check (amount_Days >= 0),
	date_Done date, /* Дата выполнения заказа */
	Cost money default 0, /* Стоимость заказа, по стандарно равно 0 */
	Foreign Key (id_Client) REFERENCES Clients(id_Client), /* Определение внешнего ключа с отсылкой на таблицу Clients*/
	Foreign Key (id_Auto) REFERENCES Cars(id_Auto) /* Определение внешнего ключа с отсылкой на таблицу Cars*/
) 