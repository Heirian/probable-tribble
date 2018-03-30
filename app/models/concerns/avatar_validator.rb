# frozen_string_literal: true

class AvatarValidator < ActiveModel::Validator
  def validate(record)
    avatar_file_size(record)
    return if record.errors.any?
    avatar_file_type(record)
    avatar_file_quantity(record)
  end

  private

  def avatar_file_size(record)
    return unless record.avatar.attached? && record.avatar.last.blob.byte_size > 100.kilobytes
    record.avatar.last.purge
    record.errors[:base] << 'Avatar is too big'
  end

  def avatar_file_type(record)
    return unless record.avatar.attached?
    return if record.avatar.last.blob.content_type.starts_with?('image/')
    record.avatar.last.purge
    record.errors[:base] << 'Avatar is in a format not allowed'
  end

  def avatar_file_quantity(record)
    return unless record.avatar.attached?
    return if record.avatar.count == 1
    record.avatar.first.purge
  end
end
