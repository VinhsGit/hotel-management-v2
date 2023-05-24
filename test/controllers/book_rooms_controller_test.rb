require "test_helper"

class BookRoomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book_room = book_rooms(:one)
  end

  test "should get index" do
    get book_rooms_url
    assert_response :success
  end

  test "should get new" do
    get new_book_room_url
    assert_response :success
  end

  test "should create book_room" do
    assert_difference("BookRoom.count") do
      post book_rooms_url, params: { book_room: { checkIn: @book_room.checkIn, checkOut: @book_room.checkOut, customer_id: @book_room.customer_id, description: @book_room.description, room_id: @book_room.room_id } }
    end

    assert_redirected_to book_room_url(BookRoom.last)
  end

  test "should show book_room" do
    get book_room_url(@book_room)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_room_url(@book_room)
    assert_response :success
  end

  test "should update book_room" do
    patch book_room_url(@book_room), params: { book_room: { checkIn: @book_room.checkIn, checkOut: @book_room.checkOut, customer_id: @book_room.customer_id, description: @book_room.description, room_id: @book_room.room_id } }
    assert_redirected_to book_room_url(@book_room)
  end

  test "should destroy book_room" do
    assert_difference("BookRoom.count", -1) do
      delete book_room_url(@book_room)
    end

    assert_redirected_to book_rooms_url
  end
end
