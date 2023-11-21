class AddOnboardingMailSentToClubs < ActiveRecord::Migration[7.0]
  def change
    add_column :clubs, :onboarding_mail_sent, :boolean, default: false
  end
end
