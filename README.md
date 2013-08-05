Patches Rails's `redirect` method to preserve marketing parameters (`utm_source`, etc.)
through redirects, eliminating the need to put the code in numerous controllers.

Note: this deals with unfortunate situations where the redirects are unavoidable.
In general you should *rework inbound campaign links to avoid redirects.*
This gem provides a nice safety net.

## Usage

    # in Gemfile
    gem 'save-the-campaign'

The gem will automatically patch ApplicationController so that the redirects are
instrumented properly.

### Configuration

By default, the gem forwards the following parameters:
  * `utm_campaign`
  * `utm_medium`
  * `utm_source`
  * `utm_term`
  * `utm_name`
  * `utm_content`
  * `utm_keyword`
  * `gclid`

To forward other parameters, modify `SaveTheCampaign.configuration` using an initializer:

    # in initializers/save_the_campaign.rb*
    SaveTheCampaign.configure do |config|
      config.params << 'email'
    end

To only include the patch in specified controllers, you'll need to:

  1. use `gem 'save-the-campaign', require: false` in the `Gemfile`
  2. create an `initializers/save_the_campaign.rb` and configure `auto_install = false`
  3. explicitly include `SaveTheCampaign::ControllerMixin` in any controllers that need
     the behavior

### Use Case

If a marketing campaign drops a user on a page that redirects elsewhere,
we want to preserve the `utm_` parameters passed in. An important case
is when a marketing campaign sends users to a page behind login when the
user is not logged in. This is rare in the wild, but we have re-engagement
campaigns that can do this.

In addition, we have lots of redirects built into the legacy site, so as
we re-work our URL scheme, it's possible users will be redirected somewhere
else, depending on their state.


### How it Works

The essence of this functionality to patch `_compute_redirect_to_location`.
The patch is found in `lib/save_the_campaign/installer.rb`.


### References

   * http://www.e-nor.com/blog/web-analytics/no-data-from-one-or-more-sources-in-your-analytics-reports
   * https://support.google.com/analytics/answer/1033867?hl=en


### Author

   * Andrew Peterson, [http://ndpsoftware.com], [andy@stitchfix.com], or [andy@ndpsoftware.com]


## Contributing & Bug Reports

Use Github Issues and Pull Requests