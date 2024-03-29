require 'cobreak/version'
class BaseDato
  $db = Sequel.sqlite
  $db.create_table? :database do
    String :text_db
  end
  def initialize(alg = nil)
  @alg = alg
  end
  def database(alg)
    var1 = File.join(Gem.path[1], "gems", "cobreak-#{CoBreak.version}", 'lib', 'cobreak', 'hash', 'hash.db')
    if File.exists?(var1) == false
      FileUtils.touch(var1)
    end
      IO.foreach(var1) {|line|
        line.chomp!
        $db[:database] << {text_db:line}
      }
      if ($db[:database].filter(text_db:alg).map(:text_db)).include?(alg) == true
        exit
      end
      File.open(var1, mode: 'a'){|lin|
        lin.puts alg
      }
  end
end
$datBas = BaseDato.new
