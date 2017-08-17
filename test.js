function f(n, l){
	var result = [];
	for (var i = 0; i <= n; i++) {
		for (var j = 0; j < l; j++) {
			result.push(i);
		}
	}
	return result;
}

var x = f(10000, 10000);
console.log(x.length);
