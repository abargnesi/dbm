## dbm-mapdb3

#### overview

This is a fork of [jruby/dbm][jruby/dbm] that uses MapDB 3. This work intends to make MapDB 3 a good choice to implement the DBM abstraction in a JRuby environment.

MapDB 3.0.0 is in beta so this gem is also beta.

#### usage

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

#### build

First build the java project and copy over the JAR.

- `mvn clean package`
- `mv target/jruby-dbm-VERSION-jar-with-dependencies.jar lib/dbm.jar`
- `gem build dbm-mapdb3.gemspec`
- `gem install dbm-mapdb3-VERSION.gem`

[jruby/dbm]: https://github.com/jruby/dbm
