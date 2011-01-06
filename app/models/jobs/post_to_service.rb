#   Copyright (c) 2010, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3 or later.  See
#   the COPYRIGHT file.
#
module Jobs
  class PostToService 
    extend ResqueJobLogging
    @queue = :http

    def self.perform(service_id, post_id, url)
      service = Service.find_by_id(service_id)
      post = Post.find_by_id(post_id)
      service.post(post, url)
    end
  end
end
