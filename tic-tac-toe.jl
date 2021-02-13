@enum Cell begin
    empty
    x
    o
end

struct Board
    cells::Array{Cell, 2}

    function Board()
        return new(fill(empty, 3, 3))
    end

    function Board(cells::Array{Cell, 2})
        rows, columns = size(cells)
        if rows != 3 || columns != 3
            error("Invalid board size " * string((rows, columns)) *
                  ", must be " * string((3, 3)))
        end
        return new(cells)
    end
end


function Base.show(io::IO, board::Board)
    #  x │ x │ x
    # ───┼───┼───
    #  o │ o │ o
    # ───┼───┼───
    #  x │ x │ x
    for row in 1:3
        for column in 1:3
            cell = board.cells[row, column]
            print(" ")
            if cell == x
                print("x")
            elseif cell == o
                print("o")
            else
                print(" ")
            end
            print(" ")
            if column < 3
                print("│")
            else
                println()
            end
        end
        if row < 3
            println("───┼───┼───");
        end
    end
end
