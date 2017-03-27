import csv
import matplotlib.pyplot as plt

class Draw_Graphs:

	def __init__(self):
        	j=0

	def set_temp_lists(self):
		i=0
		self.temp_times = list()
		self.temps = list()
		for current in self.matrix:
			self.temp_times.append(self.matrix[i][0])
			self.temps.append(self.matrix[i][3])
			i=i+1

	def set_freq_lists(self):
		i=0
		j=0
		self.freq_times = list()
		self.freqs = list()
		for current in self.matrix:
			active_freq=self.matrix[i][2]
			if int(active_freq) == 15:
				self.freq_times.append(self.matrix[i][0])
				self.freqs.append(self.matrix[i][1])
				j=j+1
			i=i+1

	def read_excel(self,xx):
		self.matrix = list()
                with open(xx,'rb') as file:
			contents = csv.reader(file)
			for row in contents:
		        	self.matrix.append(row)

	
	def plot(self):
		plt.title(r'Graph Temperature and Frequency')

		plt.figure(1)
		plt.subplot(211)
		#plt.xlabel('Time')
		plt.ylabel('Frequency')
		plt.plot(self.freq_times, self.freqs,'r')

		plt.subplot(212)
		plt.xlabel('Time')
		plt.ylabel('Temperature')
		plt.plot(self.temp_times,self.temps,'b')
		plt.show()
		#plt.savefig("out.png")
	

	def debug(self):
		i=0
		for current in self.temps:
			print "Self.freq_times is %s . \n" %  self.temp_times[i]
			print "Self.temps is %s . \n" %  self.temps[i]	
			i=i+1
		


if __name__ == "__main__":
	freq_file = 'example_traces.csv'
	temp_file = 'example_temprature_trace.csv'
	dummy_file = 'dummy.csv'
    	graphs = Draw_Graphs()
    	graphs.read_excel(freq_file) 
	graphs.set_freq_lists()
	graphs.read_excel(temp_file) 
	graphs.set_temp_lists()
	graphs.plot()
	
