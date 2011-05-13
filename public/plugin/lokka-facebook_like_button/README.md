# Lokka Facebook Like Button

Facebook Like Button plugin for Lokka.

## Installation

    $ cd LOKKA_ROOT/public/plugin
    $ git clone git://github.com/champierre/lokka-facebook_like_button.git

## Usage

Change settings at plugin admin page.

In view,

    <%= facebook_like_button >
    
shows Like button for the current page.

To specify the URL, call the helper like:

    <%= facebook_like_button("http://example.com/foo/bar/") %>
