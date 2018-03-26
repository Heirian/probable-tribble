# frozen_string_literal: true

class AvatarValidator < ActiveModel::Validator
  def validate(record)
    avatar_file_size(record)
    avatar_file_type(record)
  end

  private

  def avatar_file_size(record)
    return unless record.avatar.attached? && record.avatar.blob.byte_size > 100.kilobytes
    record.avatar.purge
    record.errors[:base] << 'Too big'
  end

  def avatar_file_type(record)
    return unless record.avatar.attached?
    return if record.avatar.blob.content_type.starts_with?('image/')
    record.avatar.purge
    record.errors[:base] << 'Wrong format'
  end
end
