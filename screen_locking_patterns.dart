void main(List<String> arguments) {
  print(countPatternsFrom('A', 3));
}

Object countPatternsFrom(String f, int l) {
  var used_point = [];
  var current_point = [];
  var point_possible = {
    'A': ['B', 'E', 'F', 'D', 'H'],
    'B': ['A', 'C', 'E', 'F', 'D', 'G', 'I'],
    'C': ['B', 'D', 'E', 'F', 'H'],
    'D': ['A', 'B', 'C', 'E', 'G', 'H', 'I'],
    'E': ['A', 'B', 'C', 'D', 'F', 'G', 'H', 'I'],
    'F': ['A', 'B', 'C', 'E', 'G', 'H', 'I'],
    'G': ['D', 'B', 'E', 'F', 'H'],
    'H': ['G', 'D', 'A', 'E', 'C', 'F', 'I'],
    'I': ['H', 'D', 'E', 'B', 'F']
  };
  var num_combinations = 0;
  for (var i = 0; i < l - 1; i++) {
    if (i == 0) {
      used_point.add(f);
      current_point.add(point_possible[f]);
      num_combinations += point_possible[f]!.length;
    } else {
      for (var a = 0; a < current_point[i - 1].length; a++) {
        point_possible[current_point[i - 1][a]]!.remove(used_point);
      }
      print(point_possible);
      used_point.addAll(current_point[i - 1]);
    }
  }
  return current_point;
}
