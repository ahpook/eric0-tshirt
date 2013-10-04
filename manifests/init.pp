# == Class: tshirt
#
# This is some fakey-defines for puppet t-shirts.
#
# === Parameters
# 
# [*puppetcamp::attendee*]
#   defined type which takes a required argument $self
#
#   [*location*]
#     city name in the local language
#   
#   [*date*]
#     date of the event in ISO 8601 format (YYYY-MM-DD)
#     date ranges should be expressed as an array
#
#
# === Variables
#
# [*self*]
#   who you are
#
# === Examples
#
#  puppetcamp::attendee { $self:
#    location => 'munchen',
#    date => '2013-11-28',
#    require => Presentation['awesome', 'informative'],
#    before => Drink['beer']
#  }
#
# === Authors
#
# Eric Sorenson <eric0@puppetlabs.com> // @ahpook
#
# === Copyright
#
# Copyright 2013 Puppet Labs, Inc
#

# invoke it like this

$self = "eric0"

puppetcamp::attendee { $self:
  ensure    => present,
  location  => 'washington_dc',
  date      => '2013-11-05',
  require   => Presentation['awesome', 'informative'],
  before    => Drink['beer'],
}

#


# these need to be present to make sure it actually works

  presentation { 'awesome': }
  presentation { 'informative': }
  drink { 'beer': }

define puppetcamp::attendee( 
  $self     = 'me',
  $date     = 'now',
  $location = 'here', 
  $ensure   = present,
) {

  notify { $self: 
    message => "We're in $location on $date" 
  }

}

define drink {
  notify { $title: 
    message => "We are drinking $title!" 
  }
}

define presentation {
  notify { $title: 
    message => "This presentation was $title!" 
  }
}
