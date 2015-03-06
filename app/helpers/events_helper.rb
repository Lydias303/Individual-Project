module EventsHelper

  def event_type_helper
    Event.all.map(&:event_type).uniq
  end
end
