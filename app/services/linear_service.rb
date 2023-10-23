require 'matrix'

class LinearService
  def initialize(x, y)
    @x = Matrix[*x]
    @y = Matrix.column_vector(y)
    @theta = Matrix.zero(x[0].size)
  end

  def train(alpha, iterations)
    m = @y.row_count
    j_history = []

    iterations.times do |i|
      h = @x * @theta
      j = cost_function(h, @y)
      j_history << j

      gradient = (@x.transpose * (h - @y)) / m
      @theta -= alpha * gradient
    end

    j_history
  end

  def predict(x)
    x * @theta
  end

  private

  def cost_function(h, y)
    m = y.row_count

    unless h.row_count == y.row_count
      raise "Dimension mismatch: h (#{h.row_count}x#{h.column_count}) and y (#{y.row_count}x#{y.column_count}) have different number of rows"
    end

    (h - y).transpose * (h - y) / (2 * m)
  end
end
