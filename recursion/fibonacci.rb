def fibs(n)
    res = []
    first_num = 0
    second_num = 1
    while n > 0
        fib_num = first_num + second_num
        res << fib_num
        first_num = second_num
        second_num = fib_num
        n -= 1
    end
    res
end


def fibs_rec(n, res = [1, 2])
    if n == 1
        return [1]
    elsif n == 2
        return res
    else
        return fibs_rec(n - 1, res << res[-1] + res [-2])
    end
end

# test cases:
puts fibs(1) == [1]
puts fibs(2) == [1, 2]
puts fibs(3) == [1, 2, 3]
puts fibs(4) == [1, 2, 3, 5]
puts fibs(5) == [1, 2, 3, 5, 8]

# test cases:
puts fibs_rec(1) == [1]
puts fibs_rec(2) == [1, 2]
puts fibs_rec(3) == [1, 2, 3]
puts fibs_rec(4) == [1, 2, 3, 5]
puts fibs_rec(5) == [1, 2, 3, 5, 8]