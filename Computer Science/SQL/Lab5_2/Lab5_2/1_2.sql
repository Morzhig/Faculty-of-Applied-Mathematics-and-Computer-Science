use CarRentalDB

Create Table Clients /* �������� ������� ������� */
(
	id_Client int Primary Key, /* id �������, ��������� ���� */
	Full_Name nvarchar(50) NOT NULL, /* ��� �������, ����������� - �� ������ ���� */
	Phone_Number int UNIQUE check(Phone_Number!=''), /* ����� �������� �������, ���������� ����, �������� �� ��������� */
	id_Auto int/* id ������� ����������, ������� ����*/,
	Foreign Key (id_Auto) REFERENCES Cars(id_Auto)
)

Create Table Cars /* �������� ������� ���������� */
(
	id_Auto int Primary Key, /* id ����������, ��������� ���� */
	Brand nvarchar(50) Constraint noLada /* ����� ����������, ����������� � ��������� noLada, �����������, ����� �������� ���� �� ���� ����� LADA */
	Check (Brand != 'LADA'),
	Model nvarchar(50) NOT NULL, /* ������ ����������, �� ������ ���� */
	Colour nvarchar(50), /* ���� ���������� */
	[Availability] varchar(10), /* ������� ���������� */
	Cost money default 0
)

Create Table Orders /* �������� ������� ������ */
(
	id_Order int Primary Key, /* id ������, ��������� ���� */
	id_Client int, /* id ������� */
	id_Auto int, /* id ������� */
	date_Order date, /* ���� ������ */
	amount_Days int default 0, /* ���������� ����, �� ��������� ����� 0 */
	Constraint noNegativeDays /* ����������� � ��������� noNegativeDays, �����������, ����� ���������� ���� ���� ������������� */
	Check (amount_Days >= 0),
	date_Done date, /* ���� ���������� ������ */
	Cost money default 0, /* ��������� ������, �� ��������� ����� 0 */
	Foreign Key (id_Client) REFERENCES Clients(id_Client), /* ����������� �������� ����� � �������� �� ������� Clients*/
	Foreign Key (id_Auto) REFERENCES Cars(id_Auto) /* ����������� �������� ����� � �������� �� ������� Cars*/
) 