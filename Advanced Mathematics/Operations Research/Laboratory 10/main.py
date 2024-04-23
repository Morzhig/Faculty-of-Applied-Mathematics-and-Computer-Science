import numpy as np
from ortools.graph import max_flow

# Создаем экземпляр решателя SimpleMaxFlow.
smf = max_flow.SimpleMaxFlow()

# Определяем граф сети с помощью трех массивов: start_nodes, end_nodes и capacities.
# Длина каждого массива равна количеству дуг в графе.
start_nodes = np.array([0, 0, 0, 1, 1, 2, 2, 3, 3])
end_nodes = np.array([1, 2, 3, 2, 4, 3, 4, 2, 4])
capacities = np.array([20, 30, 10, 40, 30, 10, 20, 5, 20])

# Добавляем дуги в граф.
all_arcs = smf.add_arcs_with_capacity(start_nodes, end_nodes, capacities)

# Находим максимальный поток между узлом 0 (источник) и узлом 4 (сток).
status = smf.solve(0, 4)

# Выводим результаты.
if status != smf.OPTIMAL:
    print("Проблема с вводом максимального потока.")
else:
    print("Максимальный поток:", smf.optimal_flow())
