# -*- coding: utf-8 -*-

require 'pp'
require './atnd_api.rb'


api = AtndAPI.new

res = api.event_serach(:keyword => "沖縄県", :count => 1)
res.events.each do |event|
  pp event.event_id             # => 28462
  pp event.title                # => "日本Androidの会 沖縄支部 workshop@Naha Vol.21"
  pp event.catch                # => "Android Designers-hack でわなく Git 道場"
  pp event.event_url            # => "http://atnd.org/events/28462"
  pp event.started_at           # => "2012-05-19T14:30:00+09:00"
  pp event.ended_at             # => "2012-05-19T17:30:00+09:00"
  pp event.url                  # => "http://groups.google.com/group/android-group-okinawa?hl=ja"
  pp event.limit                # => 20
  pp event.address              # => "沖縄県那覇市樋川+1-1-77"
  pp event.place                # => "専門学校 IT カレッジ沖縄 "
  pp event.lat                  # => 26.2107516
  pp event.lon                  # => 127.6860649
  pp event.accepted             # => 2
  pp event.waiting              # => 0
  pp event.updated_at           # => "2012-05-13T19:22:13+09:00"
end
