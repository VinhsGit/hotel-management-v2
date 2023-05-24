require "application_system_test_case"

class BookRoomsTest < ApplicationSystemTestCase
  setup do
    @book_room = book_rooms(:one)
  end

  test "visiting the index" do
    visit book_rooms_url
    assert_selector "h1", text: "Book rooms"
  end

  test "should create book room" do
    visit book_rooms_url
    click_on "New book room"

    fill_in "Checkin", with: @book_room.checkIn
    fill_in "Checkout", with: @book_room.checkOut
    fill_in "Customer", with: @book_room.customer_id
    fill_in "Description", with: @book_room.description
    fill_in "Room", with: @book_room.room_id
    click_on "Create Book room"

    assert_text "Book room was successfully created"
    click_on "Back"
  end

  test "should update Book room" do
    visit book_room_url(@book_room)
    click_on "Edit this book room", match: :first

    fill_in "Checkin", with: @book_room.checkIn
    fill_in "Checkout", with: @book_room.checkOut
    fill_in "Customer", with: @book_room.customer_id
    fill_in "Description", with: @book_room.description
    fill_in "Room", with: @book_room.room_id
    click_on "Update Book room"

    assert_text "Book room was successfully updated"
    click_on "Back"
  end

  test "should destroy Book room" do
    visit book_room_url(@book_room)
    click_on "Destroy this book room", match: :first

    assert_text "Book room was successfully destroyed"
  end
end
