class BookRoomsController < ApplicationController
  before_action :authenticate, only: [:create, :update, :destroy]
  before_action :set_book_room, only: %i[ show edit update destroy ]

  # GET /book_rooms or /book_rooms.json
  def index
    @book_rooms = BookRoom.all
  end

  # GET /book_rooms/1 or /book_rooms/1.json
  def show
  end

  # GET /book_rooms/new
  def new
    @book_room = BookRoom.new
  end

  # GET /book_rooms/1/edit
  def edit
  end

  # POST /book_rooms or /book_rooms.json
  def create
    @book_room = BookRoom.new(book_room_params)
    @room = Room.find_by(id: book_room_params[:room_id])

    if @room.isAvailable && @room.checkOutDate.nil?
      @room.update(isAvailable: false, checkOutDate: book_room_params[:checkOut])
    elsif @room.checkOutDate.present? && Date.parse(book_room_params[:checkIn]) < @room.checkOutDate
      @book_room.errors.add(:base, "Room is booked on that day.")
    end

    respond_to do |format|
      if @book_room.errors.any?
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book_room.errors, status: :unprocessable_entity }
      elsif @book_room.save
        @book_room.room.update(checkOutDate: @book_room.checkOut)
        format.html { redirect_to book_room_url(@book_room), notice: "Book room was successfully created." }
        format.json { render :show, status: :created, location: @book_room }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /book_rooms/1 or /book_rooms/1.json
  def update
    respond_to do |format|
      if @book_room.update(book_room_params)
        format.html { redirect_to book_room_url(@book_room), notice: "Book room was successfully updated." }
        format.json { render :show, status: :ok, location: @book_room }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /book_rooms/1 or /book_rooms/1.json
  def destroy
    @book_room.destroy

    respond_to do |format|
      format.html { redirect_to book_rooms_url, notice: "Book room was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def authenticate
      unless logged_in?
        redirect_to user_session_path, notice: 'Please log in'
      end
    end

    def logged_in?
      user_signed_in?
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_book_room
      @book_room = BookRoom.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_room_params
      params.require(:book_room).permit(:checkIn, :checkOut, :description, :room_id, :customer_id)
    end
end
