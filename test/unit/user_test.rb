require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "username must be unique" do
    user = User.new(:username => "marco",
                    :password => "provaprova",
                    :password_confirmation => "provaprova",
                    :email => "prova@prova.com")
    assert user.save

    user = User.new(:username => "marco",
                    :password => "provaprova",
                    :password_confirmation => "provaprova",
                    :email => "prova2@prova.com")
    assert !user.save
  end

  test "password must be confirmed" do
    user = User.new(:username => "marco",
                    :password => "provaprova",
                    :password_confirmation => "provaprova",
                    :email => "prova@prova.com")
    assert user.save

    user = User.new(:username => "marco2",
                    :password => "provaprova",
                    :password_confirmation => "aaaaaaaaaaaaa",
                    :email => "prova2@prova.com")
    assert !user.save
  end

  test "email must be unique" do
    user = User.new(:username => "marco",
                    :password => "provaprova",
                    :password_confirmation => "provaprova",
                    :email => "prova@prova.com")
    assert user.save

    user = User.new(:username => "marco2",
                    :password => "provaprova",
                    :password_confirmation => "provaprova",
                    :email => "prova@prova.com")
    assert !user.save
  end

  test "email must be valid" do
    user = User.new(:username => "marco",
                    :password => "provaprova",
                    :password_confirmation => "provaprova",
                    :email => "prova@prova.com")
    assert user.save

    user = User.new(:username => "marco2",
                    :password => "provaprova",
                    :password_confirmation => "provaprova",
                    :email => "fewfwecwecw")
    assert !user.save
  end

  test "an admin must remain" do
    user = User.new(:username => "marco",
                    :password => "provaprova",
                    :password_confirmation => "provaprova",
                    :email => "prova@prova.com")
    assert user.save

    User.find_by_username("dave").destroy
    assert_equal 1, User.all.count
    e = assert_raise(RuntimeError) { user.destroy }
    assert_match(/Can't delete last user/i, e.message)
  end

  test "authentication must work" do
    user = User.new(:username => "marco",
                    :password => "provaprova",
                    :password_confirmation => "provaprova",
                    :email => "prova@prova.com")
    assert user.save
    assert_equal user, User.authenticate("marco", "provaprova")
  end

  test "ensure an admin remains" do
    user = User.new(:username => "marco",
                    :password => "provaprova",
                    :password_confirmation => "provaprova",
                    :email => "prova@prova.com")
    assert user.save
    assert_raises(RuntimeError) { User.destroy_all() }
  end
  

end
