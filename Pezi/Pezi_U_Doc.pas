unit Pezi_U_Doc;

{


========================================================
======================= SETTINGS =======================
========================================================

  Water

  (type,  characteristic)
  (1, 1) - I - Radio group index
  (1, 2) - I - Minutes
  (1, 3) - I - Custom Minutes
  (1, 4) - S - Message

    Workout

  (type, day)
  (2, 1) - A - Array of Integer // Monday
  (2, 2) - A - Array of Integer // Tuesday
  (2, 3) - A - Array of Integer // Wednesday
  (2, 4) - A - Array of Integer // Thursday
  (2, 5) - A - Array of Integer // Friday
  (2, 6) - A - Array of Integer // Saturday
  (2, 7) - A - Array of Integer // Sunday
  (2, 8) - A - Array of Integer // Single Schedule
  (2, 9) - I - 0/1 (0 - Daily Schedule, 1 - Single Schedule)

  Workout Grid
  (type, acol, arow)     acol = acharacresdf.sdf.sdf
  (2, 1, arow) - S - Exercise
  (2, 2, arow) - I - Minutes
  (2, 3, arow) - S - Mussle group

//------------------------------

  Food Grid
  (type, col, characteristic)
  (4, 1, 1) - S - Message
  (4, 1, 2) - I - Minutes

  Eyes

  (type, day)
  (3, 1) - A - Array of Integer // Monday
  (3, 2) - A - Array of Integer // Tuesday
  (3, 3) - A - Array of Integer // Wednesday
  (3, 4) - A - Array of Integer // Thursday
  (3, 5) - A - Array of Integer // Friday
  (3, 6) - A - Array of Integer // Saturday
  (3, 7) - A - Array of Integer // Sunday
  (3, 8) - A - Array of Integer // Single Schedule
  (3, 9) - I - 0/1 (0 - Daily Schedule, 1 - Single Schedule)


  Food Grid
  (type, col, characteristic)
  (3, 1, 1) - S - Message
  (3, 1, 2) - I - Minutes
  Food

  (type, day)
  (4, 1) - A - Array of Integer // Monday
  (4, 2) - A - Array of Integer // Tuesday
  (4, 3) - A - Array of Integer // Wednesday
  (4, 4) - A - Array of Integer // Thursday
  (4, 5) - A - Array of Integer // Friday
  (4, 6) - A - Array of Integer // Saturday
  (4, 7) - A - Array of Integer // Sunday
  (4, 8) - A - Array of Integer // Single Schedule
  (4, 9) - I - 0/1 (0 - Daily Schedule, 1 - Single Schedule)


  Food Grid
  (type, col, characteristic)
  (4, col 1, 1) - S - Message
  (4, col 2, 2) - I - Minutes


  //------------------------------
  (5, 1) - Popup Position

  ========================================================
  ========================= LOGS =========================
  ========================================================

  Water
  (1, 1, comboboxnum) -  i   - Combobox checked - (0- no; 1- yes)
  (1, 2, comboboxnum) - Date - Current Date Time of the event
  (1, 3, comboboxnum) -  r   - ammount of water

  Workout
  (2, 1, comboboxnum) -  i   - Combobox checked - (0- no; 1- yes)
  (2, 2, comboboxnum) - Date - Current Date Time of the event
  (2, 3, comboboxnum) -  i   - Row of the grid with excercises

  Eyes
  (3, 1, comboboxnum) -  i   - Combobox checked - (0- no; 1- yes)
  (3, 2, comboboxnum) - Date - Current Date Time of the event
  (3, 3, comboboxnum) -  i   - Row of the grid with eyes excercises

  Food
  (4, 1, comboboxnum) -  i   - Combobox checked - (0- no; 1- yes)
  (4, 2, comboboxnum) - Date - Current Date Time of the event
  (4, 3, comboboxnum) -  i   - Row of the grid with foods


}

interface

implementation

end.
