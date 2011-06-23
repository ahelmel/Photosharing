require 'test_helper'

class SperrenTest < ActiveSupport::TestCase
  test "Sperre ohne Start Datum" do
	sperre = Sperren.new(:endDate => "18.05.2011", :reason => "insult" )
    assert !sperre.save, "Sperre wurde ohne Startdatum gespeichert"
  end
  
  test "Sperre ohne End Datum" do
	sperre = Sperren.new(:startDate => "18.05.2011", :reason => "insult" )
    assert !sperre.save, "Sperre wurde ohne Enddatum gespeichert"
  end
  
  test "Sperre ohne Grund" do
	sperre = Sperren.new(:startDate => "18.05.2011", :endDate => "19.05.2011" )
    assert !sperre.save, "Sperre wurde ohne Grund gespeichert"
  end
  
  test "Sperre sollte gespeichert werden" do
	sperre = Sperren.new(:startDate => "10.05.2011", :endDate => "18.05.2011", :reason => "insult" )
    assert sperre.save, "Sperre wurde nicht erstellt"
  end
  
end
