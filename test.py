def f(n, l):
	result = []
	for i in range(0, n + 1):
		for j in range(0, l):
			result.append(i)
	return result


x = f(10000, 10000)
print(len(x))
