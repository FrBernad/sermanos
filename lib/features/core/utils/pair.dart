class Pair<K, V> {
  final K key;

  final V value;

  const factory Pair(K key, V value) = Pair<K, V>._;

  const Pair._(this.key, this.value);
}
