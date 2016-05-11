dbm-mapdb3
==========

This is a fork of [jruby/dbm][jruby/dbm] that uses MapDB 3.

It provides a DBM interface (using MapDB) for use in JRuby.

```ruby
require 'dbm'

db = DBM.open('/tmp/objects.db')
10_000.times each |num|
  db[num.to_s] = Marshal.dump([1,2,3,4,5])
end

Marshal.load(db['5000']) # => [1, 2, 3, 4, 5]

db.shift # => ["0", "\u0004\b[\ni\u0006i\ai\bi\ti\n"]
```

[jruby/dbm]: https://github.com/jruby/dbm
