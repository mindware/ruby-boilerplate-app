module Generator
  class Base

    # access the global data loaded by the driver
    def data
      $loader.data
    end
  end
end
